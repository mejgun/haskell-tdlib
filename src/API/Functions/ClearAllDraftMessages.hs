-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ClearAllDraftMessages where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data ClearAllDraftMessages = 
 ClearAllDraftMessages { exclude_secret_chats :: Bool }  -- deriving (Show)

instance T.ToJSON ClearAllDraftMessages where
 toJSON (ClearAllDraftMessages { exclude_secret_chats = exclude_secret_chats }) =
  A.object [ "@type" A..= T.String "clearAllDraftMessages", "exclude_secret_chats" A..= exclude_secret_chats ]
-- clearAllDraftMessages ClearAllDraftMessages  { exclude_secret_chats :: Bool } 

