-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.DisableProxy where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data DisableProxy = 
 DisableProxy -- deriving (Show)

instance T.ToJSON DisableProxy where
 toJSON (DisableProxy {  }) =
  A.object [ "@type" A..= T.String "disableProxy" ]
-- disableProxy DisableProxy 

