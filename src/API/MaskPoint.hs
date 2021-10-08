-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.MaskPoint where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Part of the face, relative to which a mask is placed
data MaskPoint = 
 -- |
 -- 
 -- The mask is placed relatively to the forehead
 MaskPointForehead |
 -- |
 -- 
 -- The mask is placed relatively to the eyes
 MaskPointEyes |
 -- |
 -- 
 -- The mask is placed relatively to the mouth
 MaskPointMouth |
 -- |
 -- 
 -- The mask is placed relatively to the chin
 MaskPointChin deriving (Eq)

instance Show MaskPoint where
 show MaskPointForehead {  } =
  "MaskPointForehead" ++ cc [ ]

 show MaskPointEyes {  } =
  "MaskPointEyes" ++ cc [ ]

 show MaskPointMouth {  } =
  "MaskPointMouth" ++ cc [ ]

 show MaskPointChin {  } =
  "MaskPointChin" ++ cc [ ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON MaskPoint where
 toJSON MaskPointForehead {  } =
  A.object [ "@type" A..= T.String "maskPointForehead" ]

 toJSON MaskPointEyes {  } =
  A.object [ "@type" A..= T.String "maskPointEyes" ]

 toJSON MaskPointMouth {  } =
  A.object [ "@type" A..= T.String "maskPointMouth" ]

 toJSON MaskPointChin {  } =
  A.object [ "@type" A..= T.String "maskPointChin" ]

instance T.FromJSON MaskPoint where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "maskPointForehead" -> parseMaskPointForehead v
   "maskPointEyes" -> parseMaskPointEyes v
   "maskPointMouth" -> parseMaskPointMouth v
   "maskPointChin" -> parseMaskPointChin v
   _ -> mempty
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
 parseJSON _ = mempty
