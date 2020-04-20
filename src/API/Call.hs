-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Call where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.CallState as CallState

--main = putStrLn "ok"

data Call = 
 Call { state :: CallState.CallState, is_outgoing :: Bool, user_id :: Int, _id :: Int }  -- deriving (Show)

instance T.ToJSON Call where
 toJSON (Call { state = state, is_outgoing = is_outgoing, user_id = user_id, _id = _id }) =
  A.object [ "@type" A..= T.String "call", "state" A..= state, "is_outgoing" A..= is_outgoing, "user_id" A..= user_id, "id" A..= _id ]
-- call Call  { state :: CallState.CallState, is_outgoing :: Bool, user_id :: Int, _id :: Int } 

