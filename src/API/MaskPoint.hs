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



instance T.FromJSON MaskPoint where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "maskPointForehead" -> parseMaskPointForehead v
   "maskPointEyes" -> parseMaskPointEyes v
   "maskPointMouth" -> parseMaskPointMouth v
   "maskPointChin" -> parseMaskPointChin v
  where
   parseMaskPointForehead :: A.Value -> T.Parser MaskPoint
   parseMaskPointForehead = A.withObject "MaskPointForehead" $ \o -> do
    return $ MaskPointForehead {  }

   parseMaskPointEyes :: A.Value -> T.Parser MaskPoint
   parseMaskPointEyes = A.withObject "MaskPointEyes" $ \o -> do
    return $ MaskPointEyes {  }

   parseMaskPointMouth :: A.Value -> T.Parser MaskPoint
   parseMaskPointMouth = A.withObject "MaskPointMouth" $ \o -> do
    return $ MaskPointMouth {  }

   parseMaskPointChin :: A.Value -> T.Parser MaskPoint
   parseMaskPointChin = A.withObject "MaskPointChin" $ \o -> do
    return $ MaskPointChin {  }