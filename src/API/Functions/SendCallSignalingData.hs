-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SendCallSignalingData where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Sends call signaling data 
-- 
-- __call_id__ Call identifier
-- 
-- __data__ The data
data SendCallSignalingData = 

 SendCallSignalingData { _data :: Maybe String, call_id :: Maybe Int }  deriving (Eq)

instance Show SendCallSignalingData where
 show SendCallSignalingData { _data=_data, call_id=call_id } =
  "SendCallSignalingData" ++ U.cc [U.p "_data" _data, U.p "call_id" call_id ]

instance T.ToJSON SendCallSignalingData where
 toJSON SendCallSignalingData { _data = _data, call_id = call_id } =
  A.object [ "@type" A..= T.String "sendCallSignalingData", "data" A..= _data, "call_id" A..= call_id ]

instance T.FromJSON SendCallSignalingData where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "sendCallSignalingData" -> parseSendCallSignalingData v
   _ -> mempty
  where
   parseSendCallSignalingData :: A.Value -> T.Parser SendCallSignalingData
   parseSendCallSignalingData = A.withObject "SendCallSignalingData" $ \o -> do
    _data <- o A..:? "data"
    call_id <- mconcat [ o A..:? "call_id", readMaybe <$> (o A..: "call_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SendCallSignalingData { _data = _data, call_id = call_id }
 parseJSON _ = mempty
