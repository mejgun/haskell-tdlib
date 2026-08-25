module TD.Data.DraftMessageContent
  (DraftMessageContent(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.FormattedText as FormattedText
import qualified TD.Data.LinkPreviewOptions as LinkPreviewOptions
import qualified TD.Data.RichMessage as RichMessage
import qualified TD.Data.InputRichMessage as InputRichMessage
import qualified Data.Text as T
import qualified TD.Data.MessageSelfDestructType as MessageSelfDestructType
import qualified Data.ByteString as BS

-- | Content of the message draft
data DraftMessageContent
  = DraftMessageContentText -- ^ A text message draft
    { text                 :: Maybe FormattedText.FormattedText           -- ^ Formatted text to be saved as a draft; 0-getOption("message_text_length_max") characters
    , link_preview_options :: Maybe LinkPreviewOptions.LinkPreviewOptions -- ^ Options to be used for generation of a link preview; may be null if none; pass null to use default link preview options
    }
  | DraftMessageContentRichMessage -- ^ A rich message draft; not supported in setChatDraftMessage
    { message :: Maybe RichMessage.RichMessage -- ^ The rich message
    }
  | DraftMessageContentInputRichMessage -- ^ A rich message draft; only for setChatDraftMessage
    { _message :: Maybe InputRichMessage.InputRichMessage -- ^ The rich message
    }
  | DraftMessageContentVideoNote -- ^ A video note message draft
    { file_path          :: Maybe T.Text                                          -- ^ Path to the file with the video note
    , duration           :: Maybe Int                                             -- ^ Duration of the video, in seconds; 0-60
    , _length            :: Maybe Int                                             -- ^ Video width and height; must be positive and not greater than 640
    , self_destruct_type :: Maybe MessageSelfDestructType.MessageSelfDestructType -- ^ Video note self-destruct type; may be null if none; pass null if none; private chats only
    }
  | DraftMessageContentVoiceNote -- ^ A voice note message draft
    { file_path          :: Maybe T.Text                                          -- ^ Path to the file with the voice note
    , duration           :: Maybe Int                                             -- ^ Duration of the voice note, in seconds
    , waveform           :: Maybe BS.ByteString                                   -- ^ Waveform representation of the voice note in 5-bit format
    , self_destruct_type :: Maybe MessageSelfDestructType.MessageSelfDestructType -- ^ Voice note self-destruct type; may be null if none; pass null if none; private chats only
    }
  deriving (Eq, Show)

instance I.ShortShow DraftMessageContent where
  shortShow DraftMessageContentText
    { text                 = text_
    , link_preview_options = link_preview_options_
    }
      = "DraftMessageContentText"
        ++ I.cc
        [ "text"                 `I.p` text_
        , "link_preview_options" `I.p` link_preview_options_
        ]
  shortShow DraftMessageContentRichMessage
    { message = message_
    }
      = "DraftMessageContentRichMessage"
        ++ I.cc
        [ "message" `I.p` message_
        ]
  shortShow DraftMessageContentInputRichMessage
    { _message = _message_
    }
      = "DraftMessageContentInputRichMessage"
        ++ I.cc
        [ "_message" `I.p` _message_
        ]
  shortShow DraftMessageContentVideoNote
    { file_path          = file_path_
    , duration           = duration_
    , _length            = _length_
    , self_destruct_type = self_destruct_type_
    }
      = "DraftMessageContentVideoNote"
        ++ I.cc
        [ "file_path"          `I.p` file_path_
        , "duration"           `I.p` duration_
        , "_length"            `I.p` _length_
        , "self_destruct_type" `I.p` self_destruct_type_
        ]
  shortShow DraftMessageContentVoiceNote
    { file_path          = file_path_
    , duration           = duration_
    , waveform           = waveform_
    , self_destruct_type = self_destruct_type_
    }
      = "DraftMessageContentVoiceNote"
        ++ I.cc
        [ "file_path"          `I.p` file_path_
        , "duration"           `I.p` duration_
        , "waveform"           `I.p` waveform_
        , "self_destruct_type" `I.p` self_destruct_type_
        ]

instance AT.FromJSON DraftMessageContent where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "draftMessageContentText"             -> parseDraftMessageContentText v
      "draftMessageContentRichMessage"      -> parseDraftMessageContentRichMessage v
      "draftMessageContentInputRichMessage" -> parseDraftMessageContentInputRichMessage v
      "draftMessageContentVideoNote"        -> parseDraftMessageContentVideoNote v
      "draftMessageContentVoiceNote"        -> parseDraftMessageContentVoiceNote v
      _                                     -> mempty
    
    where
      parseDraftMessageContentText :: A.Value -> AT.Parser DraftMessageContent
      parseDraftMessageContentText = A.withObject "DraftMessageContentText" $ \o -> do
        text_                 <- o A..:?  "text"
        link_preview_options_ <- o A..:?  "link_preview_options"
        pure $ DraftMessageContentText
          { text                 = text_
          , link_preview_options = link_preview_options_
          }
      parseDraftMessageContentRichMessage :: A.Value -> AT.Parser DraftMessageContent
      parseDraftMessageContentRichMessage = A.withObject "DraftMessageContentRichMessage" $ \o -> do
        message_ <- o A..:?  "message"
        pure $ DraftMessageContentRichMessage
          { message = message_
          }
      parseDraftMessageContentInputRichMessage :: A.Value -> AT.Parser DraftMessageContent
      parseDraftMessageContentInputRichMessage = A.withObject "DraftMessageContentInputRichMessage" $ \o -> do
        _message_ <- o A..:?  "message"
        pure $ DraftMessageContentInputRichMessage
          { _message = _message_
          }
      parseDraftMessageContentVideoNote :: A.Value -> AT.Parser DraftMessageContent
      parseDraftMessageContentVideoNote = A.withObject "DraftMessageContentVideoNote" $ \o -> do
        file_path_          <- o A..:?  "file_path"
        duration_           <- o A..:?  "duration"
        _length_            <- o A..:?  "length"
        self_destruct_type_ <- o A..:?  "self_destruct_type"
        pure $ DraftMessageContentVideoNote
          { file_path          = file_path_
          , duration           = duration_
          , _length            = _length_
          , self_destruct_type = self_destruct_type_
          }
      parseDraftMessageContentVoiceNote :: A.Value -> AT.Parser DraftMessageContent
      parseDraftMessageContentVoiceNote = A.withObject "DraftMessageContentVoiceNote" $ \o -> do
        file_path_          <- o A..:?                       "file_path"
        duration_           <- o A..:?                       "duration"
        waveform_           <- fmap I.readBytes <$> o A..:?  "waveform"
        self_destruct_type_ <- o A..:?                       "self_destruct_type"
        pure $ DraftMessageContentVoiceNote
          { file_path          = file_path_
          , duration           = duration_
          , waveform           = waveform_
          , self_destruct_type = self_destruct_type_
          }
  parseJSON _ = mempty

instance AT.ToJSON DraftMessageContent where
  toJSON DraftMessageContentText
    { text                 = text_
    , link_preview_options = link_preview_options_
    }
      = A.object
        [ "@type"                A..= AT.String "draftMessageContentText"
        , "text"                 A..= text_
        , "link_preview_options" A..= link_preview_options_
        ]
  toJSON DraftMessageContentRichMessage
    { message = message_
    }
      = A.object
        [ "@type"   A..= AT.String "draftMessageContentRichMessage"
        , "message" A..= message_
        ]
  toJSON DraftMessageContentInputRichMessage
    { _message = _message_
    }
      = A.object
        [ "@type"   A..= AT.String "draftMessageContentInputRichMessage"
        , "message" A..= _message_
        ]
  toJSON DraftMessageContentVideoNote
    { file_path          = file_path_
    , duration           = duration_
    , _length            = _length_
    , self_destruct_type = self_destruct_type_
    }
      = A.object
        [ "@type"              A..= AT.String "draftMessageContentVideoNote"
        , "file_path"          A..= file_path_
        , "duration"           A..= duration_
        , "length"             A..= _length_
        , "self_destruct_type" A..= self_destruct_type_
        ]
  toJSON DraftMessageContentVoiceNote
    { file_path          = file_path_
    , duration           = duration_
    , waveform           = waveform_
    , self_destruct_type = self_destruct_type_
    }
      = A.object
        [ "@type"              A..= AT.String "draftMessageContentVoiceNote"
        , "file_path"          A..= file_path_
        , "duration"           A..= duration_
        , "waveform"           A..= fmap I.writeBytes  waveform_
        , "self_destruct_type" A..= self_destruct_type_
        ]

