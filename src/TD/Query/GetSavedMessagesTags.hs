module TD.Query.GetSavedMessagesTags
  (GetSavedMessagesTags(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns tags used in Saved Messages or a Saved Messages topic. Returns 'TD.Data.SavedMessagesTags.SavedMessagesTags'
data GetSavedMessagesTags
  = GetSavedMessagesTags
    { saved_messages_topic_id :: Maybe Int -- ^ Identifier of Saved Messages topic which tags will be returned; pass 0 to get all Saved Messages tags
    }
  deriving (Eq, Show)

instance I.ShortShow GetSavedMessagesTags where
  shortShow
    GetSavedMessagesTags
      { saved_messages_topic_id = saved_messages_topic_id_
      }
        = "GetSavedMessagesTags"
          ++ I.cc
          [ "saved_messages_topic_id" `I.p` saved_messages_topic_id_
          ]

instance AT.ToJSON GetSavedMessagesTags where
  toJSON
    GetSavedMessagesTags
      { saved_messages_topic_id = saved_messages_topic_id_
      }
        = A.object
          [ "@type"                   A..= AT.String "getSavedMessagesTags"
          , "saved_messages_topic_id" A..= saved_messages_topic_id_
          ]

