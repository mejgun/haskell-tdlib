-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.TerminateSession where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data TerminateSession = 
 TerminateSession { session_id :: Int }  -- deriving (Show)

instance T.ToJSON TerminateSession where
 toJSON (TerminateSession { session_id = session_id }) =
  A.object [ "@type" A..= T.String "terminateSession", "session_id" A..= session_id ]
-- terminateSession TerminateSession  { session_id :: Int } 

