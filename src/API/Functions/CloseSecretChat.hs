-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CloseSecretChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data CloseSecretChat = 
 CloseSecretChat { secret_chat_id :: Int }  -- deriving (Show)

instance T.ToJSON CloseSecretChat where
 toJSON (CloseSecretChat { secret_chat_id = secret_chat_id }) =
  A.object [ "@type" A..= T.String "closeSecretChat", "secret_chat_id" A..= secret_chat_id ]
-- closeSecretChat CloseSecretChat  { secret_chat_id :: Int } 

