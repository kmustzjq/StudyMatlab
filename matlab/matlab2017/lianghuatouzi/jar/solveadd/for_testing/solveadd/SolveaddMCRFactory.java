/*
 * MATLAB Compiler: 6.4 (R2017a)
 * Date: Wed Apr 11 10:34:39 2018
 * Arguments: 
 * "-B""macro_default""-W""java:solveadd,Class1""-T""link:lib""-d""E:\\daima\\matlab\\matlab2017\\lianghuatouzi\\jar\\solveadd\\for_testing""class{Class1:E:\\daima\\matlab\\matlab2017\\lianghuatouzi\\main.m,E:\\daima\\matlab\\matlab2017\\lianghuatouzi\\solveadd.m}""-a""E:\\daima\\matlab\\matlab2017\\lianghuatouzi\\main.m"
 */

package solveadd;

import com.mathworks.toolbox.javabuilder.*;
import com.mathworks.toolbox.javabuilder.internal.*;

/**
 * <i>INTERNAL USE ONLY</i>
 */
public class SolveaddMCRFactory
{
   
    
    /** Component's uuid */
    private static final String sComponentId = "solveadd_C54C35EC847F7634FB07AF75EBAA5B54";
    
    /** Component name */
    private static final String sComponentName = "solveadd";
    
   
    /** Pointer to default component options */
    private static final MWComponentOptions sDefaultComponentOptions = 
        new MWComponentOptions(
            MWCtfExtractLocation.EXTRACT_TO_CACHE, 
            new MWCtfClassLoaderSource(SolveaddMCRFactory.class)
        );
    
    
    private SolveaddMCRFactory()
    {
        // Never called.
    }
    
    public static MWMCR newInstance(MWComponentOptions componentOptions) throws MWException
    {
        if (null == componentOptions.getCtfSource()) {
            componentOptions = new MWComponentOptions(componentOptions);
            componentOptions.setCtfSource(sDefaultComponentOptions.getCtfSource());
        }
        return MWMCR.newInstance(
            componentOptions, 
            SolveaddMCRFactory.class, 
            sComponentName, 
            sComponentId,
            new int[]{9,2,0}
        );
    }
    
    public static MWMCR newInstance() throws MWException
    {
        return newInstance(sDefaultComponentOptions);
    }
}
