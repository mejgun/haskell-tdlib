-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetSavedOrderInfo where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Returns saved order info, if any
data GetSavedOrderInfo = 

 GetSavedOrderInfo deriving (Eq)

instance Show GetSavedOrderInfo where
 show GetSavedOrderInfo {  } =
  "GetSavedOrderInfo" ++ cc [ ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetSavedOrderInfo where
 toJSON GetSavedOrderInfo {  } =
  A.object [ "@type" A..= T.String "getSavedOrderInfo" ]

instance T.FromJSON GetSavedOrderInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getSavedOrderInfo" -> parseGetSavedOrderInfo v
   _ -> mempty
  where
   parseGetSavedOrderInfo :: A.Value -> T.Parser GetSavedOrderInfo
   parseGetSavedOrderInfo = A.withObject "GetSavedOrderInfo" $ \o -> do
    return $ GetSavedOrderInfo {  }
 parseJSON _ = mempty
