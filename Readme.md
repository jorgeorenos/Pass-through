# Estimación de un modelo autorregresivo por umbrales. Ejemplo para la estimación del _Pass-through_ del tipo de cambio

La teoría económica establece que existe una relación entre los precios internos de una econmía y el tipo de cambio de la moneda con el que se comercian los bienes transables[^1], de forma más precisa, si el tipo de cambio subre una depreciación esta se verá reflejada en un aumento del nivel de precios y lo contrario si se atraviesa una apreciación.

Este tipo de relación recibe el nombre de Efecto Traspaso del tipo de cambio a precios (_Pass-through_) y se han investigado de manera teorica como empírica. Uno de los trabajos que aborda el tema es el elaborado por John B. Taylor titulado _Low Inflation, Pass-Through, and the Pricing Power of Firms_. Taylor expone que la labor de los Bancos Centrales de mantener una infalción baja y estable posee un beneficio que en su momento pasó inadvertido, y este es que los entornos de inflación baja y estable atenuan cualquier tipo de choque que pueda existir sobre los precios, esto incluye los choques cambiarios. A partir de lo anterior el presente trabajo toma como base lo expuesto por Taylor y busca estimar el efecto traspaso para Guatemala bajo distintos entornos inflacionarios.


Dentro de las premisas que se consideraron fue que la inflación en Guatemala ha presentado una tendencia clara hacia la baja y a mantenerse dentro de la meta de inflación fijada por el Banco Central[^2]. Como segundo punto se tiene que el tipo de cambio en Guatemala se liberó en la decada de los 90's y el Banco Central interviene únicamente para moderar su volatilidad más su tendencia.

|Evolución de la inflación| Evolución del tipo de cambio|
|-------------------------|-----------------------------|
|![Evolución inflación](https://github.com/jorgeorenos/Pass-through-R/blob/master/Im%C3%A1genes/Evoluci%C3%B3n%20inflaci%C3%B3n.svg)| ![Evolución del tipo de cambio](https://github.com/jorgeorenos/Pass-through-R/blob/master/Im%C3%A1genes/Evoluci%C3%B3n%20del%20tipo%20de%20cambio.svg) |

En virtud de lo anterior se construyó un modelo autoregresivo por umbrales (TAR  por sus siglas en inglés) el cual tiene la particularidad de no ser lineal debido a que sus parámetros varían en función del estado de una variable del sistema. Para los fines que se persigue la variable que define el cambio en los parámetros del modelo fue la inflación doméstica con lo que la especificación del modelo queda de la siguiente manera:



$inf^{gt}_t =  \begin{cases}
    \alpha_0 + \gamma deprec^{gt}_t  + \alpha_1 inf^{gt}_{t-1} + \alpha_2 inf^{eua}_t + \alpha_3 ciclo^{gt}_t & si & inf^{gt}_{t-1} & si & y_{t-1} \leq 0.14 \\
    \alpha_0 + \beta deprec^{gt}_t  + \alpha_1 inf^{gt}_{t-1} + \alpha_2 inf^{eua}_t + \alpha_3 ciclo^{gt}_t & si & inf^{gt}_{t-1} & si & 0.14 < y_{t-1} \leq 0.83 \\
    \alpha_0 + \delta deprec^{gt}_t  + \alpha_1 inf^{gt}_{t-1} + \alpha_2 inf^{eua}_t + \alpha_3 ciclo^{gt}_t & si & inf^{gt}_{t-1} & si & y_{t-1} > 0.83
\end{cases}
$

$\text{Donde}$

$inf^{gt}_t \text{ Es la inflación de Guatemala en el periodo t}$

$deprec^{gt}_t \text{ Es la depreciación del tipo de cambio y sus coeficientes asociados son el coeficiente de traspaso en el periodo t}$

$inf^{gt}_{t-1} \text{ Es el componente inercial de la inflación de Guatemala}$

$inf^{eua}_t \text{ Es la inflación de Estados Unidos en el periodo t}$

$cilo^{gt}_t \text{ Es el ciclo económico en el periodo t}$

Los umbrales de inflación que definen estado del sistema se obtuvieron siguiendo la metodología expuesta por Chang(1993) y la estimación del modelo dio lo siguientes reseultados:

Régimen inflacionario                                      |coeficiente       |Efecto traspaso
-----------------------------------------------------------|------------------|---------------
Inflación alta                                             |$\delta$          | 0.10405%
Inflación media                                            |$\beta$           | 0.0101%
Inflación baja                                             |$\gamma$          |-0.14533%
                                           
El modelo muetra como a partir de que el componente inercial de la inflación cruza de umbral de inflación alta a media el efecto traspaso disminuye y lo hace aún más en el entorno inflacionario bajo.

Para un mayor detalle de la estimación puede consultar el [archivo Rmd](https://github.com/jorgeorenos/Pass-through-R/blob/master/C%C3%B3digo/Estimaci%C3%B3n%20TAR%20Chan%20mensuales.Rmd) de este repositorio que lo contiene.

[^1]: Los bienes trasables son aquellos que pueden ser comercializados en el mercado doméstico como externo.
[^2]: 4% mas menos 1%
