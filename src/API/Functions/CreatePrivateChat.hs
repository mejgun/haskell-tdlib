-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CreatePrivateChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data CreatePrivateChat = 
 CreatePrivateChat { force :: Bool, user_id :: Int }  -- deriving (Show)

instance T.ToJSON CreatePrivateChat where
 toJSON (CreatePrivateChat { force = force, user_id = user_id }) =
  A.object [ "@type" A..= T.String "createPrivateChat", "force" A..= force, "user_id" A..= user_id ]
-- createPrivateChat CreatePrivateChat  { force :: Bool, user_id :: Int } 

