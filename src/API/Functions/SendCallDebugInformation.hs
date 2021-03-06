-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SendCallDebugInformation where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Sends debug information for a call 
-- 
-- __call_id__ Call identifier
-- 
-- __debug_information__ Debug information in application-specific format
data SendCallDebugInformation = 

 SendCallDebugInformation { debug_information :: Maybe String, call_id :: Maybe Int }  deriving (Show, Eq)

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
    debug_information <- o A..:? "debug_information"
    call_id <- mconcat [ o A..:? "call_id", readMaybe <$> (o A..: "call_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SendCallDebugInformation { debug_information = debug_information, call_id = call_id }