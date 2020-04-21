-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetChatPhoto where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputFile as InputFile

data SetChatPhoto = 
 SetChatPhoto { photo :: InputFile.InputFile, chat_id :: Int }  deriving (Show)

instance T.ToJSON SetChatPhoto where
 toJSON (SetChatPhoto { photo = photo, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "setChatPhoto", "photo" A..= photo, "chat_id" A..= chat_id ]

instance T.FromJSON SetChatPhoto where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setChatPhoto" -> parseSetChatPhoto v
   _ -> mempty
  where
   parseSetChatPhoto :: A.Value -> T.Parser SetChatPhoto
   parseSetChatPhoto = A.withObject "SetChatPhoto" $ \o -> do
    photo <- o A..: "photo"
    chat_id <- o A..: "chat_id"
    return $ SetChatPhoto { photo = photo, chat_id = chat_id }