-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetSecretChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetSecretChat = 
 GetSecretChat { secret_chat_id :: Int }  -- deriving (Show)

instance T.ToJSON GetSecretChat where
 toJSON (GetSecretChat { secret_chat_id = secret_chat_id }) =
  A.object [ "@type" A..= T.String "getSecretChat", "secret_chat_id" A..= secret_chat_id ]
-- getSecretChat GetSecretChat  { secret_chat_id :: Int } 

