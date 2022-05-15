{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.FileDownload where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.Message as Message
import qualified Utils as U

-- |
data FileDownload = -- | Describes a file added to file download list
  FileDownload
  { -- | True, if downloading of the file is paused
    is_paused :: Maybe Bool,
    -- | Point in time (Unix timestamp) when the file downloading was completed; 0 if the file downloading isn't completed
    complete_date :: Maybe Int,
    -- | Point in time (Unix timestamp) when the file was added to the download list
    add_date :: Maybe Int,
    -- | The message with the file
    message :: Maybe Message.Message,
    -- | File identifier
    file_id :: Maybe Int
  }
  deriving (Eq)

instance Show FileDownload where
  show
    FileDownload
      { is_paused = is_paused_,
        complete_date = complete_date_,
        add_date = add_date_,
        message = message_,
        file_id = file_id_
      } =
      "FileDownload"
        ++ U.cc
          [ U.p "is_paused" is_paused_,
            U.p "complete_date" complete_date_,
            U.p "add_date" add_date_,
            U.p "message" message_,
            U.p "file_id" file_id_
          ]

instance T.FromJSON FileDownload where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "fileDownload" -> parseFileDownload v
      _ -> mempty
    where
      parseFileDownload :: A.Value -> T.Parser FileDownload
      parseFileDownload = A.withObject "FileDownload" $ \o -> do
        is_paused_ <- o A..:? "is_paused"
        complete_date_ <- o A..:? "complete_date"
        add_date_ <- o A..:? "add_date"
        message_ <- o A..:? "message"
        file_id_ <- o A..:? "file_id"
        return $ FileDownload {is_paused = is_paused_, complete_date = complete_date_, add_date = add_date_, message = message_, file_id = file_id_}
  parseJSON _ = mempty

instance T.ToJSON FileDownload where
  toJSON
    FileDownload
      { is_paused = is_paused_,
        complete_date = complete_date_,
        add_date = add_date_,
        message = message_,
        file_id = file_id_
      } =
      A.object
        [ "@type" A..= T.String "fileDownload",
          "is_paused" A..= is_paused_,
          "complete_date" A..= complete_date_,
          "add_date" A..= add_date_,
          "message" A..= message_,
          "file_id" A..= file_id_
        ]
