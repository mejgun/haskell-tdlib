-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CreateSecretChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data CreateSecretChat = 
 CreateSecretChat { secret_chat_id :: Int }  -- deriving (Show)

instance T.ToJSON CreateSecretChat where
 toJSON (CreateSecretChat { secret_chat_id = secret_chat_id }) =
  A.object [ "@type" A..= T.String "createSecretChat", "secret_chat_id" A..= secret_chat_id ]
-- createSecretChat CreateSecretChat  { secret_chat_id :: Int } 

