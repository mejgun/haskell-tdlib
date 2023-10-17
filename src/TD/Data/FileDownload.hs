module TD.Data.FileDownload
  (FileDownload(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Message as Message

data FileDownload
  = FileDownload -- ^ Describes a file added to file download list
    { file_id       :: Maybe Int             -- ^ File identifier
    , message       :: Maybe Message.Message -- ^ The message with the file
    , add_date      :: Maybe Int             -- ^ Point in time (Unix timestamp) when the file was added to the download list
    , complete_date :: Maybe Int             -- ^ Point in time (Unix timestamp) when the file downloading was completed; 0 if the file downloading isn't completed
    , is_paused     :: Maybe Bool            -- ^ True, if downloading of the file is paused
    }
  deriving (Eq, Show)

instance I.ShortShow FileDownload where
  shortShow FileDownload
    { file_id       = file_id_
    , message       = message_
    , add_date      = add_date_
    , complete_date = complete_date_
    , is_paused     = is_paused_
    }
      = "FileDownload"
        ++ I.cc
        [ "file_id"       `I.p` file_id_
        , "message"       `I.p` message_
        , "add_date"      `I.p` add_date_
        , "complete_date" `I.p` complete_date_
        , "is_paused"     `I.p` is_paused_
        ]

instance AT.FromJSON FileDownload where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "fileDownload" -> parseFileDownload v
      _              -> mempty
    
    where
      parseFileDownload :: A.Value -> AT.Parser FileDownload
      parseFileDownload = A.withObject "FileDownload" $ \o -> do
        file_id_       <- o A..:?  "file_id"
        message_       <- o A..:?  "message"
        add_date_      <- o A..:?  "add_date"
        complete_date_ <- o A..:?  "complete_date"
        is_paused_     <- o A..:?  "is_paused"
        pure $ FileDownload
          { file_id       = file_id_
          , message       = message_
          , add_date      = add_date_
          , complete_date = complete_date_
          , is_paused     = is_paused_
          }
  parseJSON _ = mempty

