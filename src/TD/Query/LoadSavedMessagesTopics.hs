module TD.Query.LoadSavedMessagesTopics
  (LoadSavedMessagesTopics(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Loads more Saved Messages topics. The loaded topics will be sent through updateSavedMessagesTopic. Topics are sorted by their topic.order in descending order. Returns a 404 error if all topics have been loaded. Returns 'TD.Data.Ok.Ok'
data LoadSavedMessagesTopics
  = LoadSavedMessagesTopics
    { limit :: Maybe Int -- ^ The maximum number of topics to be loaded. For optimal performance, the number of loaded topics is chosen by TDLib and can be smaller than the specified limit, even if the end of the list is not reached
    }
  deriving (Eq, Show)

instance I.ShortShow LoadSavedMessagesTopics where
  shortShow
    LoadSavedMessagesTopics
      { limit = limit_
      }
        = "LoadSavedMessagesTopics"
          ++ I.cc
          [ "limit" `I.p` limit_
          ]

instance AT.ToJSON LoadSavedMessagesTopics where
  toJSON
    LoadSavedMessagesTopics
      { limit = limit_
      }
        = A.object
          [ "@type" A..= AT.String "loadSavedMessagesTopics"
          , "limit" A..= limit_
          ]

