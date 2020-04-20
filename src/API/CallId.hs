-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.CallId where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data CallId = 
 CallId { _id :: Int }  -- deriving (Show)

instance T.ToJSON CallId where
 toJSON (CallId { _id = _id }) =
  A.object [ "@type" A..= T.String "callId", "id" A..= _id ]
-- callId CallId  { _id :: Int } 

