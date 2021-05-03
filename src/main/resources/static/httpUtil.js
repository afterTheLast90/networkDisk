let httpUtil = axios.create({
    headers: {
        'content-type': 'application/json'
    }
})
httpUtil.interceptors.request.use(
    config => {
        layer.load(2);
        return config;
    }
)

httpUtil.interceptors.response.use(
    response => {
        //拦截响应，做统一处理
        console.log("============拦截器拦截输出==================")
        console.log(response.data)
        console.log("==========================================")
        layer.closeAll('loading');
        layer.msg(response.data.msg);
        if (response.data.code) {
            if (response.data.code !== 200)
                return Promise.reject(response.data)
        }

        return response.data
    },
    //接口错误状态处理，也就是说无响应时的处理
    error => {
        layer.closeAll('loading');
        console.log("============拦截器拦截输出==================")
        console.log(response.data)
        console.log("==========================================")
        layer.msg("网络错误，请稍后再试")
        return Promise.reject(response.data) // 返回接口返回的错误信息
    })

export default httpUtil