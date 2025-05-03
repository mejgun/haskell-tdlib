module TD.Query.DeleteBusinessStory
  (DeleteBusinessStory(..)
  , defaultDeleteBusinessStory
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Deletes a story posted by the bot on behalf of a business account; for bots only. Returns 'TD.Data.Ok.Ok'
data DeleteBusinessStory
  = DeleteBusinessStory
    { business_connection_id :: Maybe T.Text -- ^ Unique identifier of business connection
    , story_id               :: Maybe Int    -- ^ Identifier of the story to delete
    }
  deriving (Eq, Show)

instance I.ShortShow DeleteBusinessStory where
  shortShow
    DeleteBusinessStory
      { business_connection_id = business_connection_id_
      , story_id               = story_id_
      }
        = "DeleteBusinessStory"
          ++ I.cc
          [ "business_connection_id" `I.p` business_connection_id_
          , "story_id"               `I.p` story_id_
          ]

instance AT.ToJSON DeleteBusinessStory where
  toJSON
    DeleteBusinessStory
      { business_connection_id = business_connection_id_
      , story_id               = story_id_
      }
        = A.object
          [ "@type"                  A..= AT.String "deleteBusinessStory"
          , "business_connection_id" A..= business_connection_id_
          , "story_id"               A..= story_id_
          ]

defaultDeleteBusinessStory :: DeleteBusinessStory
defaultDeleteBusinessStory =
  DeleteBusinessStory
    { business_connection_id = Nothing
    , story_id               = Nothing
    }

