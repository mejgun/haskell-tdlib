-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.AcceptCall where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.CallProtocol as CallProtocol

data AcceptCall = 
 AcceptCall { protocol :: CallProtocol.CallProtocol, call_id :: Int }  deriving (Show)

instance T.ToJSON AcceptCall where
 toJSON (AcceptCall { protocol = protocol, call_id = call_id }) =
  A.object [ "@type" A..= T.String "acceptCall", "protocol" A..= protocol, "call_id" A..= call_id ]

instance T.FromJSON AcceptCall where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "acceptCall" -> parseAcceptCall v
   _ -> mempty
  where
   parseAcceptCall :: A.Value -> T.Parser AcceptCall
   parseAcceptCall = A.withObject "AcceptCall" $ \o -> do
    protocol <- o A..: "protocol"
    call_id <- o A..: "call_id"
    return $ AcceptCall { protocol = protocol, call_id = call_id }