-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.AcceptCall where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.CallProtocol as CallProtocol

--main = putStrLn "ok"

data AcceptCall = 
 AcceptCall { protocol :: CallProtocol.CallProtocol, call_id :: Int }  -- deriving (Show)

instance T.ToJSON AcceptCall where
 toJSON (AcceptCall { protocol = protocol, call_id = call_id }) =
  A.object [ "@type" A..= T.String "acceptCall", "protocol" A..= protocol, "call_id" A..= call_id ]
-- acceptCall AcceptCall  { protocol :: CallProtocol.CallProtocol, call_id :: Int } 

