module TD.Query.GetStoryAlbumStories
  (GetStoryAlbumStories(..)
  , defaultGetStoryAlbumStories
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns the list of stories added to the given story album. For optimal performance, the number of returned stories is chosen by TDLib. Returns 'TD.Data.Stories.Stories'
data GetStoryAlbumStories
  = GetStoryAlbumStories
    { chat_id        :: Maybe Int -- ^ Chat identifier
    , story_album_id :: Maybe Int -- ^ Story album identifier
    , offset         :: Maybe Int -- ^ Offset of the first entry to return; use 0 to get results from the first album story
    , limit          :: Maybe Int -- ^ The maximum number of stories to be returned. For optimal performance, the number of returned stories is chosen by TDLib and can be smaller than the specified limit
    }
  deriving (Eq, Show)

instance I.ShortShow GetStoryAlbumStories where
  shortShow
    GetStoryAlbumStories
      { chat_id        = chat_id_
      , story_album_id = story_album_id_
      , offset         = offset_
      , limit          = limit_
      }
        = "GetStoryAlbumStories"
          ++ I.cc
          [ "chat_id"        `I.p` chat_id_
          , "story_album_id" `I.p` story_album_id_
          , "offset"         `I.p` offset_
          , "limit"          `I.p` limit_
          ]

instance AT.ToJSON GetStoryAlbumStories where
  toJSON
    GetStoryAlbumStories
      { chat_id        = chat_id_
      , story_album_id = story_album_id_
      , offset         = offset_
      , limit          = limit_
      }
        = A.object
          [ "@type"          A..= AT.String "getStoryAlbumStories"
          , "chat_id"        A..= chat_id_
          , "story_album_id" A..= story_album_id_
          , "offset"         A..= offset_
          , "limit"          A..= limit_
          ]

defaultGetStoryAlbumStories :: GetStoryAlbumStories
defaultGetStoryAlbumStories =
  GetStoryAlbumStories
    { chat_id        = Nothing
    , story_album_id = Nothing
    , offset         = Nothing
    , limit          = Nothing
    }

