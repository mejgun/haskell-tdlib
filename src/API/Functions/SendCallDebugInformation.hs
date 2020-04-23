-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SendCallDebugInformation where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data SendCallDebugInformation = 
 SendCallDebugInformation { debug_information :: Maybe String, call_id :: Maybe Int }  deriving (Show)

instance T.ToJSON SendCallDebugInformation where
 toJSON (SendCallDebugInformation { debug_information = debug_information, call_id = call_id }) =
  A.object [ "@type" A..= T.String "sendCallDebugInformation", "debug_information" A..= debug_information, "call_id" A..= call_id ]

instance T.FromJSON SendCallDebugInformation where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "sendCallDebugInformation" -> parseSendCallDebugInformation v
   _ -> mempty
  where
   parseSendCallDebugInformation :: A.Value -> T.Parser SendCallDebugInformation
   parseSendCallDebugInformation = A.withObject "SendCallDebugInformation" $ \o -> do
    debug_information <- optional $ o A..: "debug_information"
    call_id <- optional $ o A..: "call_id"
    return $ SendCallDebugInformation { debug_information = debug_information, call_id = call_id }