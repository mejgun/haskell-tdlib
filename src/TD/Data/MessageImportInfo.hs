module TD.Data.MessageImportInfo
  (MessageImportInfo(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data MessageImportInfo
  = MessageImportInfo -- ^ Contains information about a message created with importMessages
    { sender_name :: Maybe T.Text -- ^ Name of the original sender
    , date        :: Maybe Int    -- ^ Point in time (Unix timestamp) when the message was originally sent
    }
  deriving (Eq, Show)

instance I.ShortShow MessageImportInfo where
  shortShow MessageImportInfo
    { sender_name = sender_name_
    , date        = date_
    }
      = "MessageImportInfo"
        ++ I.cc
        [ "sender_name" `I.p` sender_name_
        , "date"        `I.p` date_
        ]

instance AT.FromJSON MessageImportInfo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "messageImportInfo" -> parseMessageImportInfo v
      _                   -> mempty
    
    where
      parseMessageImportInfo :: A.Value -> AT.Parser MessageImportInfo
      parseMessageImportInfo = A.withObject "MessageImportInfo" $ \o -> do
        sender_name_ <- o A..:?  "sender_name"
        date_        <- o A..:?  "date"
        pure $ MessageImportInfo
          { sender_name = sender_name_
          , date        = date_
          }
  parseJSON _ = mempty

