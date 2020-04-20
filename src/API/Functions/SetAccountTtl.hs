-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetAccountTtl where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.AccountTtl as AccountTtl

--main = putStrLn "ok"

data SetAccountTtl = 
 SetAccountTtl { ttl :: AccountTtl.AccountTtl }  -- deriving (Show)

instance T.ToJSON SetAccountTtl where
 toJSON (SetAccountTtl { ttl = ttl }) =
  A.object [ "@type" A..= T.String "setAccountTtl", "ttl" A..= ttl ]
-- setAccountTtl SetAccountTtl  { ttl :: AccountTtl.AccountTtl } 

