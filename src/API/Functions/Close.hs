-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.Close where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data Close = 
 Close -- deriving (Show)

instance T.ToJSON Close where
 toJSON (Close {  }) =
  A.object [ "@type" A..= T.String "close" ]
-- close Close 

