-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.MaskPoint where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data MaskPoint = 
 MaskPointForehead 
 | MaskPointEyes 
 | MaskPointMouth 
 | MaskPointChin -- deriving (Show)

instance T.ToJSON MaskPoint where
 toJSON (MaskPointForehead {  }) =
  A.object [ "@type" A..= T.String "maskPointForehead" ]

 toJSON (MaskPointEyes {  }) =
  A.object [ "@type" A..= T.String "maskPointEyes" ]

 toJSON (MaskPointMouth {  }) =
  A.object [ "@type" A..= T.String "maskPointMouth" ]

 toJSON (MaskPointChin {  }) =
  A.object [ "@type" A..= T.String "maskPointChin" ]
-- maskPointForehead MaskPoint 

-- maskPointEyes MaskPoint 

-- maskPointMouth MaskPoint 

-- maskPointChin MaskPoint 

