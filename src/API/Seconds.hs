-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Seconds where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data Seconds = 
 Seconds { seconds :: Float }  -- deriving (Show)

instance T.ToJSON Seconds where
 toJSON (Seconds { seconds = seconds }) =
  A.object [ "@type" A..= T.String "seconds", "seconds" A..= seconds ]
-- seconds Seconds  { seconds :: Float } 

