-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetSavedOrderInfo where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Returns saved order information. Returns a 404 error if there is no saved order information
data GetSavedOrderInfo = 

 GetSavedOrderInfo deriving (Eq)

instance Show GetSavedOrderInfo where
 show GetSavedOrderInfo {  } =
  "GetSavedOrderInfo" ++ U.cc [ ]

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
