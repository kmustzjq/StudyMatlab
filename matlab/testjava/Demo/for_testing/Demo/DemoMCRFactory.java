/*
 * MATLAB Compiler: 6.4 (R2017a)
 * Date: Thu Feb 08 18:10:27 2018
 * Arguments: 
 * "-B""macro_default""-W""java:Demo,Class1""-T""link:lib""-d""E:\\daima\\matlab\\testjava\\Demo\\for_testing""class{Class1:E:\\daima\\matlab\\testjava\\drawplot.m}"
 */

package Demo;

import com.mathworks.toolbox.javabuilder.*;
import com.mathworks.toolbox.javabuilder.internal.*;

/**
 * <i>INTERNAL USE ONLY</i>
 */
public class DemoMCRFactory
{
   
    
    /** Component's uuid */
    private static final String sComponentId = "Demo_B522B60C00B30CDFD51513A23A9CE814";
    
    /** Component name */
    private static final String sComponentName = "Demo";
    
   
    /** Pointer to default component options */
    private static final MWComponentOptions sDefaultComponentOptions = 
        new MWComponentOptions(
            MWCtfExtractLocation.EXTRACT_TO_CACHE, 
            new MWCtfClassLoaderSource(DemoMCRFactory.class)
        );
    
    
    private DemoMCRFactory()
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
            DemoMCRFactory.class, 
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
