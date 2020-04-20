-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CreateNewSecretChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data CreateNewSecretChat = 
 CreateNewSecretChat { user_id :: Int }  -- deriving (Show)

instance T.ToJSON CreateNewSecretChat where
 toJSON (CreateNewSecretChat { user_id = user_id }) =
  A.object [ "@type" A..= T.String "createNewSecretChat", "user_id" A..= user_id ]
-- createNewSecretChat CreateNewSecretChat  { user_id :: Int } 

