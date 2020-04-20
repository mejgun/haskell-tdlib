-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetAlarm where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data SetAlarm = 
 SetAlarm { seconds :: Float }  -- deriving (Show)

instance T.ToJSON SetAlarm where
 toJSON (SetAlarm { seconds = seconds }) =
  A.object [ "@type" A..= T.String "setAlarm", "seconds" A..= seconds ]
-- setAlarm SetAlarm  { seconds :: Float } 

