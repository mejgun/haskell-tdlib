-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PushReceiverId where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data PushReceiverId = 
 PushReceiverId { _id :: Int }  -- deriving (Show)

instance T.ToJSON PushReceiverId where
 toJSON (PushReceiverId { _id = _id }) =
  A.object [ "@type" A..= T.String "pushReceiverId", "id" A..= _id ]
-- pushReceiverId PushReceiverId  { _id :: Int } 

