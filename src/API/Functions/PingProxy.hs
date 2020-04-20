-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.PingProxy where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data PingProxy = 
 PingProxy { proxy_id :: Int }  -- deriving (Show)

instance T.ToJSON PingProxy where
 toJSON (PingProxy { proxy_id = proxy_id }) =
  A.object [ "@type" A..= T.String "pingProxy", "proxy_id" A..= proxy_id ]
-- pingProxy PingProxy  { proxy_id :: Int } 

