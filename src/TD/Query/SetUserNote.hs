module TD.Query.SetUserNote
  (SetUserNote(..)
  , defaultSetUserNote
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.FormattedText as FormattedText

-- | Changes a note of a contact user. Returns 'TD.Data.Ok.Ok'
data SetUserNote
  = SetUserNote
    { user_id :: Maybe Int                         -- ^ User identifier
    , note    :: Maybe FormattedText.FormattedText -- ^ Note to set for the user; 0-getOption("user_note_text_length_max") characters. Only Bold, Italic, Underline, Strikethrough, Spoiler, and CustomEmoji entities are allowed
    }
  deriving (Eq, Show)

instance I.ShortShow SetUserNote where
  shortShow
    SetUserNote
      { user_id = user_id_
      , note    = note_
      }
        = "SetUserNote"
          ++ I.cc
          [ "user_id" `I.p` user_id_
          , "note"    `I.p` note_
          ]

instance AT.ToJSON SetUserNote where
  toJSON
    SetUserNote
      { user_id = user_id_
      , note    = note_
      }
        = A.object
          [ "@type"   A..= AT.String "setUserNote"
          , "user_id" A..= user_id_
          , "note"    A..= note_
          ]

defaultSetUserNote :: SetUserNote
defaultSetUserNote =
  SetUserNote
    { user_id = Nothing
    , note    = Nothing
    }

