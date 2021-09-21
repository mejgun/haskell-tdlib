-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ImportMessages where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputFile as InputFile

-- |
-- 
-- Imports messages exported from another app
-- 
-- __chat_id__ Identifier of a chat to which the messages will be imported. It must be an identifier of a private chat with a mutual contact or an identifier of a supergroup chat with can_change_info administrator right
-- 
-- __message_file__ File with messages to import. Only inputFileLocal and inputFileGenerated are supported. The file must not be previously uploaded
-- 
-- __attached_files__ Files used in the imported messages. Only inputFileLocal and inputFileGenerated are supported. The files must not be previously uploaded
data ImportMessages = 

 ImportMessages { attached_files :: Maybe [InputFile.InputFile], message_file :: Maybe InputFile.InputFile, chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON ImportMessages where
 toJSON (ImportMessages { attached_files = attached_files, message_file = message_file, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "importMessages", "attached_files" A..= attached_files, "message_file" A..= message_file, "chat_id" A..= chat_id ]

instance T.FromJSON ImportMessages where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "importMessages" -> parseImportMessages v
   _ -> mempty
  where
   parseImportMessages :: A.Value -> T.Parser ImportMessages
   parseImportMessages = A.withObject "ImportMessages" $ \o -> do
    attached_files <- o A..:? "attached_files"
    message_file <- o A..:? "message_file"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ImportMessages { attached_files = attached_files, message_file = message_file, chat_id = chat_id }