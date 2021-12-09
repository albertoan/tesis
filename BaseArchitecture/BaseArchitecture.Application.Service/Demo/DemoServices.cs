using Newtonsoft.Json;
using BaseArchitecture.Application.IService.Demo;
using BaseArchitecture.Application.TransferObject.Request.Base;
using BaseArchitecture.Application.TransferObject.Request.Demo;
using BaseArchitecture.Application.TransferObject.Response.Common;
using BaseArchitecture.Application.TransferObject.Response.Demo;
using BaseArchitecture.Application.TransferObject.Response.Access;
using BaseArchitecture.Cross.LoggerTrace;
using BaseArchitecture.Repository.Entity.Demo;
using BaseArchitecture.Repository.IData.NonTransactional;
using BaseArchitecture.Repository.IData.Transactional;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Transactions;
using System.Web.Http;
using map = AutoMapper;
using Util = BaseArchitecture.Cross.SystemVariable.Util;

namespace BaseArchitecture.Application.Service.Demo
{
    public class DemoServices : IDemoService
    {
        public IDemoQuery DemoQuery { get; set; }
        public IDemoTransaction DemoTransaction { get; set; }
        public Trace TraceLogger =>
            (Trace)GlobalConfiguration.Configuration.DependencyResolver.GetService(typeof(Trace));
        public Response<CollectionDataResponse<PersonResponse>> ListPersonAll(PersonFilterRequest personFilterRequest)
        {
            var result = DemoQuery.ListPersonAll(personFilterRequest).ToList();
            var typeOrder = (personFilterRequest.Pagination.TypeOrder == "desc")
                ? Util.Extension.TypeOrder.Desc
                : Util.Extension.TypeOrder.Asc;
            var pros = Util.Page<PersonResponse>.CreateInstance(personFilterRequest.Pagination.CurrentPage,
                personFilterRequest.Pagination.RowsPerPage, result);
            var listResult = pros.Filter(personFilterRequest.FilterColumn)
                .Order(personFilterRequest.Pagination.ColumnOrder, typeOrder)
                .Pagination().Collection;
            var collectionDataResponse = new CollectionDataResponse<PersonResponse>()
            {
                Collection = listResult,
                Pagination = new PaginationResponse()
                {
                    QuantityRows = pros.QuantityRows,
                    TotalPages = pros.TotalPages
                }
            };

            var response = new Response<CollectionDataResponse<PersonResponse>>()
            {
                Value = collectionDataResponse
            };
            return response;
        }

        public Response<List<ProyectoResponse>> ListProyectos()
        {
            var result = DemoQuery.ListProyectos().ToList();

            var response = new Response<List<ProyectoResponse>>()
            {
                Value = result
            };
            return response;
        }

        public Response<List<MasterResponse>> ListMaster()
        {
            var result = DemoQuery.ListMaster().ToList();

            var response = new Response<List<MasterResponse>>()
            {
                Value = result
            };
            return response;
        }

        public Response<List<ProyectoResponse>> ListProyectoCodigo()
        {
            var result = DemoQuery.ListProyectoCodigo().ToList();

            var response = new Response<List<ProyectoResponse>>()
            {
                Value = result
            };
            return response;
        }

        public Response<UbigeoResponse> ListUBIGEO()
        {
            var result = DemoQuery.ListUBIGEO();
            return result;
        }

        public Response<ProyectoResponse> GetProyectoById(ProyectoRequest proyectoRequest)
        {
            var result = DemoQuery.GetProyectoById(proyectoRequest);
            return result;
        }

        public Response<ProyectoResponse> GetListProyectoByIdProyecto(ProyectoRequest proyectoRequest)
        {
            var result = DemoQuery.GetListProyectoByIdProyecto(proyectoRequest);
            return result;
        }


        public Response<PersonResponse> GetPersonById(PersonBaseRequest personBaseRequest)
        {
            var result = DemoQuery.GetPersonById(personBaseRequest);
            return result;
        }

        public Response<List<ProgramacionResponse>> ListProgramacion()
        {
            var result = DemoQuery.ListProgramacion().ToList();

            var response = new Response<List<ProgramacionResponse>>()
            {
                Value = result
            };
            return response;
        }

        public Response<int> RegProgramacion(ProgramacionRequest programacionRequest)
        {
            var result = DemoQuery.RegProgramacion(programacionRequest);
            return result;
        }

        public Response<int> RegProyecto(ProyectoRequest proyectoRequest)
        {
            var result = DemoQuery.RegProyecto(proyectoRequest);
            var idProyecto = result.Value;

            using (var transaction = new TransactionScope())
            {
                try
                {
                    foreach (var itemOrderDetail in proyectoRequest.ProyectoActividadesRequest)
                    {
                        DemoTransaction.RegCronograma(itemOrderDetail, idProyecto);
                    }
                    //result = new Response<string>();

                    //correo
                    transaction.Complete();
                }
                catch (Exception e)
                {
                    //result = 99;
                    
                }
            }

            return result;
        }

        public Response<int> RegInformeCoordinador(InformeCoordinadorRequest informeCoordinadorRequest)
        {
            var result = DemoQuery.RegInformeCoordinador(informeCoordinadorRequest);
            var idProyecto = result.Value;

            //using (var transaction = new TransactionScope())
            //{
            //    try
            //    {
            //        foreach (var itemOrderDetail in proyectoRequest.ProyectoActividadesRequest)
            //        {
            //            DemoTransaction.RegCronograma(itemOrderDetail, idProyecto);
            //        }
            //        transaction.Complete();
            //    }
            //    catch (Exception e)
            //    {
            //        //result = 99;
            //    }
            //}

            return result;
        }

        

        public Response<int> RegPerson(PersonRequest personRequest, BaseRecordRequest baseRecordRequest)
        {
            var result = new Response<int>(1);
            using (var transaction = new TransactionScope())
            {
                try
                {
                    var personEntity =
                        map.Mapper.Map<PersonRequest, PersonEntity>(personRequest);
                    DemoTransaction.RegPerson(personEntity, baseRecordRequest);
                    transaction.Complete();
                }
                catch (Exception e)
                {
                    TraceLogger.RegisterExceptionDemand(JsonConvert.SerializeObject(e));
                    result = new Response<int>(0);
                }
            }

            return result;
        }

        public Response<int> UpdPersonState(PersonBaseRequest personBaseRequest, BaseRecordRequest baseRecordRequest)
        {
            var result = new Response<int>(1);
            using (var transaction = new TransactionScope())
            {
                try
                {
                    DemoTransaction.UpdPersonState(personBaseRequest, baseRecordRequest);
                    transaction.Complete();
                }
                catch (Exception e)
                {
                    TraceLogger.RegisterExceptionDemand(JsonConvert.SerializeObject(e));
                    result = new Response<int>(0);
                }
            }

            return result;
        }


        /// <summary>
        ///     Method that get MasterTableResponse by IdMasterTable
        /// </summary>
        /// <param name="masterTableRequest">Params entry</param>
        /// <remarks>
        ///     The method GetMasterById get list MasterTable and filter by IdMasterTable
        /// </remarks>
        /// <returns>Return entity MasterTableResponse</returns>
        public MasterTableResponse GetMasterById(MasterTableRequest masterTableRequest)
        {
            var result = GetAllMaster(masterTableRequest);
            return result.FirstOrDefault(x => x.IdMasterTable == masterTableRequest.IdMasterTable);
        }

        public Response<IEnumerable<MasterTableResponse>> ListMasterTable(MasterTableRequest masterTableRequest)
        {
            var result = GetAllMaster(masterTableRequest);
            var masterTableResponses =
                result.Where(x => x.IdMasterTableParent == masterTableRequest.IdMasterTableParent).ToList();

            return new Response<IEnumerable<MasterTableResponse>> { Value = masterTableResponses };
        }

        public Response<IEnumerable<MasterTableResponse>> ListMasterTableByValue(MasterTableRequest masterTableRequest)
        {
            var result = GetAllMaster(masterTableRequest);
            var masterTableResponses = result.Where(x => x.IdMasterTableParent == masterTableRequest.IdMasterTableParent
                                                         && x.Value == masterTableRequest.Value).ToList();

            return new Response<IEnumerable<MasterTableResponse>> { Value = masterTableResponses };
        }

        private IEnumerable<MasterTableResponse> GetAllMaster(MasterTableRequest masterTableRequest)
        {
            return DemoQuery.ListMasterTable(masterTableRequest);
        }

        public Response<OffLineInformeResponse> ListProyectoInforme()
        {
            var result = DemoQuery.ListProyectoInforme();
            return result;
        }

        public Response<List<CronogramaResponse>> ListProyectoCronograma()
        {
            var result = DemoQuery.ListProyectoCronograma().ToList();

            var response = new Response<List<CronogramaResponse>>()
            {
                Value = result
            };
            return response;
        }

        public Response<List<OptionResponse>> ListMenu(UserRequest userEdit)
        {
            var result = DemoQuery.ListMenu(userEdit).ToList();

            var response = new Response<List<OptionResponse>>()
            {
                Value = result
            };
            return response;
        }

        public Response<byte[]> ListProyectosRpt()
        {
            var result = DemoQuery.ListProyectosRpt();
            var ListEmployeeRptResponse = result.Value;

            string[] columns = {
                 "CODIGO"
                ,"PROYECTO"
                ,"TRANSFERENCIA"
                ,"TIPO_INVERSION"
                ,"CICLO_INVERSION"
                ,"NATURALEZA"
                ,"MODALIDAD"
                ,"ZONA"
                ,"COSTO"
                ,"DEPARTAMENTO"
                ,"PROVINCIA"
                ,"DISTRITO"
            };

            var listBytes = Util.ExcelExportHelper.ExportExcel(ListEmployeeRptResponse, string.Empty, true, columns);

            var response = new Response<byte[]>()
            {
                Value = listBytes
            };

            return response;
        }
        public Response<List<RptCantidadPoblacionPorDepartamentoResponse>> RptCantidadPoblacionPorDepartamento()
        {
            var result = DemoQuery.RptCantidadPoblacionPorDepartamento().ToList();

            var response = new Response<List<RptCantidadPoblacionPorDepartamentoResponse>>()
            {
                Value = result
            };
            return response;
        }
        public Response<List<RptCantidadProyectosPorCicloInversionResponse>> RptCantidadProyectosPorCicloInversion()
        {
            var result = DemoQuery.RptCantidadProyectosPorCicloInversion().ToList();

            var response = new Response<List<RptCantidadProyectosPorCicloInversionResponse>>()
            {
                Value = result
            };
            return response;
        }
        public Response<List<RptCantidadProyectosPorTipoProyectoResponse>> RptCantidadProyectosPorTipoProyecto()
        {
            var result = DemoQuery.RptCantidadProyectosPorTipoProyecto().ToList();

            var response = new Response<List<RptCantidadProyectosPorTipoProyectoResponse>>()
            {
                Value = result
            };
            return response;
        }
        public Response<List<RptCostoPorDepartamentoResponse>> RptCostoPorDepartamento()
        {
            var result = DemoQuery.RptCostoPorDepartamento().ToList();

            var response = new Response<List<RptCostoPorDepartamentoResponse>>()
            {
                Value = result
            };
            return response;
        }
        public Response<List<RptCostoPorTipoProyectoResponse>> RptCostoPorTipoProyecto()
        {
            var result = DemoQuery.RptCostoPorTipoProyecto().ToList();

            var response = new Response<List<RptCostoPorTipoProyectoResponse>>()
            {
                Value = result
            };
            return response;
        }
    }
}