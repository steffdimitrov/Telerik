﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ConsoleClient.DateServiceTest {
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="DateServiceTest.IDateService")]
    public interface IDateService {
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IDateService/GetDayOfWeek", ReplyAction="http://tempuri.org/IDateService/GetDayOfWeekResponse")]
        string GetDayOfWeek(System.DateTime date);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IDateService/GetDayOfWeek", ReplyAction="http://tempuri.org/IDateService/GetDayOfWeekResponse")]
        System.Threading.Tasks.Task<string> GetDayOfWeekAsync(System.DateTime date);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IDateService/GetTodayDay", ReplyAction="http://tempuri.org/IDateService/GetTodayDayResponse")]
        string GetTodayDay();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IDateService/GetTodayDay", ReplyAction="http://tempuri.org/IDateService/GetTodayDayResponse")]
        System.Threading.Tasks.Task<string> GetTodayDayAsync();
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface IDateServiceChannel : ConsoleClient.DateServiceTest.IDateService, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class DateServiceClient : System.ServiceModel.ClientBase<ConsoleClient.DateServiceTest.IDateService>, ConsoleClient.DateServiceTest.IDateService {
        
        public DateServiceClient() {
        }
        
        public DateServiceClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public DateServiceClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public DateServiceClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public DateServiceClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        public string GetDayOfWeek(System.DateTime date) {
            return base.Channel.GetDayOfWeek(date);
        }
        
        public System.Threading.Tasks.Task<string> GetDayOfWeekAsync(System.DateTime date) {
            return base.Channel.GetDayOfWeekAsync(date);
        }
        
        public string GetTodayDay() {
            return base.Channel.GetTodayDay();
        }
        
        public System.Threading.Tasks.Task<string> GetTodayDayAsync() {
            return base.Channel.GetTodayDayAsync();
        }
    }
}
