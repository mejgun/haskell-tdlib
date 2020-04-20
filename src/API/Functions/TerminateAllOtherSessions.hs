-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.TerminateAllOtherSessions where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data TerminateAllOtherSessions = 
 TerminateAllOtherSessions -- deriving (Show)

instance T.ToJSON TerminateAllOtherSessions where
 toJSON (TerminateAllOtherSessions {  }) =
  A.object [ "@type" A..= T.String "terminateAllOtherSessions" ]
-- terminateAllOtherSessions TerminateAllOtherSessions 

