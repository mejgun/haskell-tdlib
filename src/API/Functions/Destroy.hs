-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.Destroy where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data Destroy = 
 Destroy -- deriving (Show)

instance T.ToJSON Destroy where
 toJSON (Destroy {  }) =
  A.object [ "@type" A..= T.String "destroy" ]
-- destroy Destroy 

