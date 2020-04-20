-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CanTransferOwnership where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data CanTransferOwnership = 
 CanTransferOwnership -- deriving (Show)

instance T.ToJSON CanTransferOwnership where
 toJSON (CanTransferOwnership {  }) =
  A.object [ "@type" A..= T.String "canTransferOwnership" ]
-- canTransferOwnership CanTransferOwnership 

