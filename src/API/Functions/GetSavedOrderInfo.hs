-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetSavedOrderInfo where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetSavedOrderInfo = 
 GetSavedOrderInfo deriving (Show, Eq)

instance T.ToJSON GetSavedOrderInfo where
 toJSON (GetSavedOrderInfo {  }) =
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