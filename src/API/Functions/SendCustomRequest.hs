-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SendCustomRequest where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data SendCustomRequest = 
 SendCustomRequest { parameters :: Maybe String, method :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON SendCustomRequest where
 toJSON (SendCustomRequest { parameters = parameters, method = method }) =
  A.object [ "@type" A..= T.String "sendCustomRequest", "parameters" A..= parameters, "method" A..= method ]

instance T.FromJSON SendCustomRequest where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "sendCustomRequest" -> parseSendCustomRequest v
   _ -> mempty
  where
   parseSendCustomRequest :: A.Value -> T.Parser SendCustomRequest
   parseSendCustomRequest = A.withObject "SendCustomRequest" $ \o -> do
    parameters <- optional $ o A..: "parameters"
    method <- optional $ o A..: "method"
    return $ SendCustomRequest { parameters = parameters, method = method }