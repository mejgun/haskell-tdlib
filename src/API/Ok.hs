-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Ok where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data Ok = 
 Ok -- deriving (Show)

instance T.ToJSON Ok where
 toJSON (Ok {  }) =
  A.object [ "@type" A..= T.String "ok" ]
-- ok Ok 

