using BaseArchitecture.Application.IService.Demo;
using BaseArchitecture.Application.TransferObject.Request.Base;
using BaseArchitecture.Application.TransferObject.Request.Demo;
using BaseArchitecture.Cross.LoggerTrace.Filters;
using BaseArchitecture.Cross.Security.Controllers;
using BaseArchitecture.Cross.SystemVariable.Constant;
using System.Web.Http;

namespace BaseArchitecture.Distributed.WebApi.Controllers
{
    [AllowAnonymous]
    [RoutePrefix(IncomeWebApi.PrefixApi.Siscose)]
    public class DemoController : BaseWebController
    {
        public IDemoService DemoService { get; set; }

        [HttpPost]
        [Route(IncomeWebApi.MethodApi.Demo.ListMasterTableByValue)]
        [RequestLoggerFilter]
        [UnControlledExceptionFilterAttribute]
        public IHttpActionResult ListMasterTableByValue(MasterTableRequest masterTableRequest)
        {
            var result = DemoService.ListMasterTableByValue(masterTableRequest);
            return Ok(result);
        }

        [HttpPost]
        [Route(IncomeWebApi.MethodApi.Demo.ListMasterTable)]
        [RequestLoggerFilterAttribute]
        [UnControlledExceptionFilterAttribute]
        public IHttpActionResult ListMasterTable(MasterTableRequest masterTableRequest)
        {
            var result = DemoService.ListMasterTable(masterTableRequest);
            return Ok(result);
        }

        [HttpPost]
        [Route(IncomeWebApi.MethodApi.Demo.GetPersonById)]
        [RequestLoggerFilterAttribute]
        [UnControlledExceptionFilterAttribute]
        public IHttpActionResult GetPersonById(PersonBaseRequest personBaseRequest)
        {
            var result = DemoService.GetPersonById(personBaseRequest);
            return Ok(result);
        }

        [HttpPost]
        [Route(IncomeWebApi.MethodApi.Demo.ListPersonAll)]
        [RequestLoggerFilterAttribute]
        [UnControlledExceptionFilterAttribute]
        public IHttpActionResult ListPersonAll(PersonFilterRequest personFilterRequest)
        {
            var result = DemoService.ListPersonAll(personFilterRequest);
            return Ok(result);
        }

        [HttpPost]
        [Route(IncomeWebApi.MethodApi.Demo.UpdPersonState)]
        [RequestLoggerFilterAttribute]
        [UnControlledExceptionFilterAttribute]
        public IHttpActionResult UpdPersonState(PersonBaseRequest personBaseRequest)
        {
            var baseRequest = GetHeaderRequest();
            var baseRecordRequest = new BaseRecordRequest(personBaseRequest.RecordStatus, baseRequest.UserEdit)
            {
                TokenId = baseRequest.Token
            };
            var result = DemoService.UpdPersonState(personBaseRequest, baseRecordRequest);
            return Ok(result);
        }

        [HttpPost]
        [Route(IncomeWebApi.MethodApi.Demo.RegPerson)]
        [RequestLoggerFilterAttribute]
        [UnControlledExceptionFilterAttribute]
        public IHttpActionResult RegPerson(PersonRequest personRequest)
        {
            var baseRequest = GetHeaderRequest();
            var baseRecordRequest = new BaseRecordRequest(baseRequest.UserEdit)
            {
                TokenId = baseRequest.Token
            };
            var result = DemoService.RegPerson(personRequest, baseRecordRequest);
            return Ok(result);
        }

        [HttpPost]
        [Route(IncomeWebApi.MethodApi.Siscose.ListProyectos)]
        [RequestLoggerFilterAttribute]
        [UnControlledExceptionFilterAttribute]
        public IHttpActionResult ListProyectos()
        {
            var result = DemoService.ListProyectos();
            return Ok(result);
        }

        [HttpPost]
        [Route(IncomeWebApi.MethodApi.Siscose.GetProyectoById)]
        [RequestLoggerFilterAttribute]
        [UnControlledExceptionFilterAttribute]
        public IHttpActionResult GetProyectoById(ProyectoRequest proyectoRequest)
        {
            var result = DemoService.GetProyectoById(proyectoRequest);
            return Ok(result);
        }

        [HttpPost]
        [Route(IncomeWebApi.MethodApi.Siscose.GetListProyectoByIdProyecto)]
        [RequestLoggerFilterAttribute]
        [UnControlledExceptionFilterAttribute]
        public IHttpActionResult GetListProyectoByIdProyecto(ProyectoRequest proyectoRequest)
        {
            var result = DemoService.GetListProyectoByIdProyecto(proyectoRequest);
            return Ok(result);
        }

        [HttpPost]
        [Route(IncomeWebApi.MethodApi.Siscose.ListProyectoCodigo)]
        [RequestLoggerFilterAttribute]
        [UnControlledExceptionFilterAttribute]
        public IHttpActionResult ListProyectoCodigo()
        {
            var result = DemoService.ListProyectoCodigo();
            return Ok(result);
        }

        [HttpPost]
        [Route(IncomeWebApi.MethodApi.Siscose.ListUBIGEO)]
        [RequestLoggerFilterAttribute]
        [UnControlledExceptionFilterAttribute]
        public IHttpActionResult ListUBIGEO()
        {
            var result = DemoService.ListUBIGEO();
            return Ok(result);
        }

        [HttpPost]
        [Route(IncomeWebApi.MethodApi.Siscose.ListProgramacion)]
        [RequestLoggerFilterAttribute]
        [UnControlledExceptionFilterAttribute]
        public IHttpActionResult ListProgramacion()
        {
            var result = DemoService.ListProgramacion();
            return Ok(result);
        }

        [HttpPost]
        [Route(IncomeWebApi.MethodApi.Siscose.RegProgramacion)]
        [RequestLoggerFilterAttribute]
        [UnControlledExceptionFilterAttribute]
        public IHttpActionResult RegProgramacion(ProgramacionRequest programacionRequest)
        {
            var result = DemoService.RegProgramacion(programacionRequest);
            return Ok(result);
        }

        [HttpPost]
        [Route(IncomeWebApi.MethodApi.Siscose.ListMaster)]
        [RequestLoggerFilterAttribute]
        [UnControlledExceptionFilterAttribute]
        public IHttpActionResult ListMaster()
        {
            var result = DemoService.ListMaster();
            return Ok(result);
        }

        [HttpPost]
        [Route(IncomeWebApi.MethodApi.Siscose.RegProyecto)]
        [RequestLoggerFilterAttribute]
        [UnControlledExceptionFilterAttribute]
        public IHttpActionResult RegProyecto(ProyectoRequest proyectoRequest)
        {
            var result = DemoService.RegProyecto(proyectoRequest);
            return Ok(result);
        }

        [HttpPost]
        [Route(IncomeWebApi.MethodApi.Siscose.ListProyectoInforme)]
        [RequestLoggerFilterAttribute]
        [UnControlledExceptionFilterAttribute]
        public IHttpActionResult ListProyectoInforme()
        {
            var result = DemoService.ListProyectoInforme();
            return Ok(result);
        }

        [HttpPost]
        [Route(IncomeWebApi.MethodApi.Siscose.ListProyectoCronograma)]
        [RequestLoggerFilterAttribute]
        [UnControlledExceptionFilterAttribute]
        public IHttpActionResult ListProyectoCronograma()
        {
            var result = DemoService.ListProyectoCronograma();
            return Ok(result);
        }

        [HttpPost]
        [Route(IncomeWebApi.MethodApi.Siscose.ListMenu)]
        [RequestLoggerFilterAttribute]
        [UnControlledExceptionFilterAttribute]
        public IHttpActionResult ListMenu(UserRequest userEdit)
        {
            var result = DemoService.ListMenu(userEdit);
            return Ok(result);
        }

        [HttpPost]
        [RequestLoggerFilterAttribute]
        [Route(IncomeWebApi.MethodApi.Siscose.ListProyectosRpt)]
        public IHttpActionResult ListProyectosRpt()
        {
            var answerActionPendingsExcel = DemoService.ListProyectosRpt();
            return Ok(answerActionPendingsExcel);
        }

        [HttpPost]
        [Route(IncomeWebApi.MethodApi.Siscose.RptCantidadPoblacionPorDepartamento)]
        [RequestLoggerFilterAttribute]
        [UnControlledExceptionFilterAttribute]
        public IHttpActionResult RptCantidadPoblacionPorDepartamento()
        {
            var result = DemoService.RptCantidadPoblacionPorDepartamento();
            return Ok(result);
        }

        [HttpPost]
        [Route(IncomeWebApi.MethodApi.Siscose.RptCantidadProyectosPorCicloInversion)]
        [RequestLoggerFilterAttribute]
        [UnControlledExceptionFilterAttribute]
        public IHttpActionResult RptCantidadProyectosPorCicloInversion()
        {
            var result = DemoService.RptCantidadProyectosPorCicloInversion();
            return Ok(result);
        }

        [HttpPost]
        [Route(IncomeWebApi.MethodApi.Siscose.RptCantidadProyectosPorTipoProyecto)]
        [RequestLoggerFilterAttribute]
        [UnControlledExceptionFilterAttribute]
        public IHttpActionResult RptCantidadProyectosPorTipoProyecto()
        {
            var result = DemoService.RptCantidadProyectosPorTipoProyecto();
            return Ok(result);
        }

        [HttpPost]
        [Route(IncomeWebApi.MethodApi.Siscose.RptCostoPorDepartamento)]
        [RequestLoggerFilterAttribute]
        [UnControlledExceptionFilterAttribute]
        public IHttpActionResult RptCostoPorDepartamento()
        {
            var result = DemoService.RptCostoPorDepartamento();
            return Ok(result);
        }

        [HttpPost]
        [Route(IncomeWebApi.MethodApi.Siscose.RptCostoPorTipoProyecto)]
        [RequestLoggerFilterAttribute]
        [UnControlledExceptionFilterAttribute]
        public IHttpActionResult RptCostoPorTipoProyecto()
        {
            var result = DemoService.RptCostoPorTipoProyecto();
            return Ok(result);
        }

        [HttpPost]
        [Route(IncomeWebApi.MethodApi.Demo.RegPersonal)]
        [RequestLoggerFilterAttribute]
        [UnControlledExceptionFilterAttribute]
        public IHttpActionResult RegPersonal(PersonalRequest personalRequest)
        {
            var result = DemoService.RegPersonal(personalRequest);
            return Ok(result);
        }
    }
}