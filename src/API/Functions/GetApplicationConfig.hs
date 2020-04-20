-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetApplicationConfig where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetApplicationConfig = 
 GetApplicationConfig -- deriving (Show)

instance T.ToJSON GetApplicationConfig where
 toJSON (GetApplicationConfig {  }) =
  A.object [ "@type" A..= T.String "getApplicationConfig" ]
-- getApplicationConfig GetApplicationConfig 

