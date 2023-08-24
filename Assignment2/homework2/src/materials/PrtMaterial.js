class PrtMaterial extends Material
{
    constructor(vertexShader, fragmentShader) {

        super({
            'uPrecomputeL[0]': { type: 'uPrecomputeL', value: null},
            'uPrecomputeL[1]': { type: 'uPrecomputeL', value: null},
            'uPrecomputeL[2]': { type: 'uPrecomputeL', value: null}
        }, [
            'aPrecomputeLT'
        ], vertexShader, fragmentShader, null);

    }
}

async function buildPrtMaterial(vertexPath, fragmentPath)
{
    let vertexShader = await getShaderString(vertexPath);
    let fragmentShader = await getShaderString(fragmentPath);

    return new PrtMaterial(vertexShader, fragmentShader);
}
