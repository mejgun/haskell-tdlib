-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.SearchMessagesFilter where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Represents a filter for message search results
data SearchMessagesFilter = 
 -- |
 -- 
 -- Returns all found messages, no filter is applied
 SearchMessagesFilterEmpty |
 -- |
 -- 
 -- Returns only animation messages
 SearchMessagesFilterAnimation |
 -- |
 -- 
 -- Returns only audio messages
 SearchMessagesFilterAudio |
 -- |
 -- 
 -- Returns only document messages
 SearchMessagesFilterDocument |
 -- |
 -- 
 -- Returns only photo messages
 SearchMessagesFilterPhoto |
 -- |
 -- 
 -- Returns only video messages
 SearchMessagesFilterVideo |
 -- |
 -- 
 -- Returns only voice note messages
 SearchMessagesFilterVoiceNote |
 -- |
 -- 
 -- Returns only photo and video messages
 SearchMessagesFilterPhotoAndVideo |
 -- |
 -- 
 -- Returns only messages containing URLs
 SearchMessagesFilterUrl |
 -- |
 -- 
 -- Returns only messages containing chat photos
 SearchMessagesFilterChatPhoto |
 -- |
 -- 
 -- Returns only video note messages
 SearchMessagesFilterVideoNote |
 -- |
 -- 
 -- Returns only voice and video note messages
 SearchMessagesFilterVoiceAndVideoNote |
 -- |
 -- 
 -- Returns only messages with mentions of the current user, or messages that are replies to their messages
 SearchMessagesFilterMention |
 -- |
 -- 
 -- Returns only messages with unread mentions of the current user, or messages that are replies to their messages. When using this filter the results can't be additionally filtered by a query, a message thread or by the sending user
 SearchMessagesFilterUnreadMention |
 -- |
 -- 
 -- Returns only messages with unread reactions for the current user. When using this filter the results can't be additionally filtered by a query, a message thread or by the sending user
 SearchMessagesFilterUnreadReaction |
 -- |
 -- 
 -- Returns only failed to send messages. This filter can be used only if the message database is used
 SearchMessagesFilterFailedToSend |
 -- |
 -- 
 -- Returns only pinned messages
 SearchMessagesFilterPinned deriving (Eq)

instance Show SearchMessagesFilter where
 show SearchMessagesFilterEmpty {  } =
  "SearchMessagesFilterEmpty" ++ U.cc [ ]

 show SearchMessagesFilterAnimation {  } =
  "SearchMessagesFilterAnimation" ++ U.cc [ ]

 show SearchMessagesFilterAudio {  } =
  "SearchMessagesFilterAudio" ++ U.cc [ ]

 show SearchMessagesFilterDocument {  } =
  "SearchMessagesFilterDocument" ++ U.cc [ ]

 show SearchMessagesFilterPhoto {  } =
  "SearchMessagesFilterPhoto" ++ U.cc [ ]

 show SearchMessagesFilterVideo {  } =
  "SearchMessagesFilterVideo" ++ U.cc [ ]

 show SearchMessagesFilterVoiceNote {  } =
  "SearchMessagesFilterVoiceNote" ++ U.cc [ ]

 show SearchMessagesFilterPhotoAndVideo {  } =
  "SearchMessagesFilterPhotoAndVideo" ++ U.cc [ ]

 show SearchMessagesFilterUrl {  } =
  "SearchMessagesFilterUrl" ++ U.cc [ ]

 show SearchMessagesFilterChatPhoto {  } =
  "SearchMessagesFilterChatPhoto" ++ U.cc [ ]

 show SearchMessagesFilterVideoNote {  } =
  "SearchMessagesFilterVideoNote" ++ U.cc [ ]

 show SearchMessagesFilterVoiceAndVideoNote {  } =
  "SearchMessagesFilterVoiceAndVideoNote" ++ U.cc [ ]

 show SearchMessagesFilterMention {  } =
  "SearchMessagesFilterMention" ++ U.cc [ ]

 show SearchMessagesFilterUnreadMention {  } =
  "SearchMessagesFilterUnreadMention" ++ U.cc [ ]

 show SearchMessagesFilterUnreadReaction {  } =
  "SearchMessagesFilterUnreadReaction" ++ U.cc [ ]

 show SearchMessagesFilterFailedToSend {  } =
  "SearchMessagesFilterFailedToSend" ++ U.cc [ ]

 show SearchMessagesFilterPinned {  } =
  "SearchMessagesFilterPinned" ++ U.cc [ ]

instance T.ToJSON SearchMessagesFilter where
 toJSON SearchMessagesFilterEmpty {  } =
  A.object [ "@type" A..= T.String "searchMessagesFilterEmpty" ]

 toJSON SearchMessagesFilterAnimation {  } =
  A.object [ "@type" A..= T.String "searchMessagesFilterAnimation" ]

 toJSON SearchMessagesFilterAudio {  } =
  A.object [ "@type" A..= T.String "searchMessagesFilterAudio" ]

 toJSON SearchMessagesFilterDocument {  } =
  A.object [ "@type" A..= T.String "searchMessagesFilterDocument" ]

 toJSON SearchMessagesFilterPhoto {  } =
  A.object [ "@type" A..= T.String "searchMessagesFilterPhoto" ]

 toJSON SearchMessagesFilterVideo {  } =
  A.object [ "@type" A..= T.String "searchMessagesFilterVideo" ]

 toJSON SearchMessagesFilterVoiceNote {  } =
  A.object [ "@type" A..= T.String "searchMessagesFilterVoiceNote" ]

 toJSON SearchMessagesFilterPhotoAndVideo {  } =
  A.object [ "@type" A..= T.String "searchMessagesFilterPhotoAndVideo" ]

 toJSON SearchMessagesFilterUrl {  } =
  A.object [ "@type" A..= T.String "searchMessagesFilterUrl" ]

 toJSON SearchMessagesFilterChatPhoto {  } =
  A.object [ "@type" A..= T.String "searchMessagesFilterChatPhoto" ]

 toJSON SearchMessagesFilterVideoNote {  } =
  A.object [ "@type" A..= T.String "searchMessagesFilterVideoNote" ]

 toJSON SearchMessagesFilterVoiceAndVideoNote {  } =
  A.object [ "@type" A..= T.String "searchMessagesFilterVoiceAndVideoNote" ]

 toJSON SearchMessagesFilterMention {  } =
  A.object [ "@type" A..= T.String "searchMessagesFilterMention" ]

 toJSON SearchMessagesFilterUnreadMention {  } =
  A.object [ "@type" A..= T.String "searchMessagesFilterUnreadMention" ]

 toJSON SearchMessagesFilterUnreadReaction {  } =
  A.object [ "@type" A..= T.String "searchMessagesFilterUnreadReaction" ]

 toJSON SearchMessagesFilterFailedToSend {  } =
  A.object [ "@type" A..= T.String "searchMessagesFilterFailedToSend" ]

 toJSON SearchMessagesFilterPinned {  } =
  A.object [ "@type" A..= T.String "searchMessagesFilterPinned" ]

instance T.FromJSON SearchMessagesFilter where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "searchMessagesFilterEmpty" -> parseSearchMessagesFilterEmpty v
   "searchMessagesFilterAnimation" -> parseSearchMessagesFilterAnimation v
   "searchMessagesFilterAudio" -> parseSearchMessagesFilterAudio v
   "searchMessagesFilterDocument" -> parseSearchMessagesFilterDocument v
   "searchMessagesFilterPhoto" -> parseSearchMessagesFilterPhoto v
   "searchMessagesFilterVideo" -> parseSearchMessagesFilterVideo v
   "searchMessagesFilterVoiceNote" -> parseSearchMessagesFilterVoiceNote v
   "searchMessagesFilterPhotoAndVideo" -> parseSearchMessagesFilterPhotoAndVideo v
   "searchMessagesFilterUrl" -> parseSearchMessagesFilterUrl v
   "searchMessagesFilterChatPhoto" -> parseSearchMessagesFilterChatPhoto v
   "searchMessagesFilterVideoNote" -> parseSearchMessagesFilterVideoNote v
   "searchMessagesFilterVoiceAndVideoNote" -> parseSearchMessagesFilterVoiceAndVideoNote v
   "searchMessagesFilterMention" -> parseSearchMessagesFilterMention v
   "searchMessagesFilterUnreadMention" -> parseSearchMessagesFilterUnreadMention v
   "searchMessagesFilterUnreadReaction" -> parseSearchMessagesFilterUnreadReaction v
   "searchMessagesFilterFailedToSend" -> parseSearchMessagesFilterFailedToSend v
   "searchMessagesFilterPinned" -> parseSearchMessagesFilterPinned v
   _ -> mempty
  where
   parseSearchMessagesFilterEmpty :: A.Value -> T.Parser SearchMessagesFilter
   parseSearchMessagesFilterEmpty = A.withObject "SearchMessagesFilterEmpty" $ \o -> do
    return $ SearchMessagesFilterEmpty {  }

   parseSearchMessagesFilterAnimation :: A.Value -> T.Parser SearchMessagesFilter
   parseSearchMessagesFilterAnimation = A.withObject "SearchMessagesFilterAnimation" $ \o -> do
    return $ SearchMessagesFilterAnimation {  }

   parseSearchMessagesFilterAudio :: A.Value -> T.Parser SearchMessagesFilter
   parseSearchMessagesFilterAudio = A.withObject "SearchMessagesFilterAudio" $ \o -> do
    return $ SearchMessagesFilterAudio {  }

   parseSearchMessagesFilterDocument :: A.Value -> T.Parser SearchMessagesFilter
   parseSearchMessagesFilterDocument = A.withObject "SearchMessagesFilterDocument" $ \o -> do
    return $ SearchMessagesFilterDocument {  }

   parseSearchMessagesFilterPhoto :: A.Value -> T.Parser SearchMessagesFilter
   parseSearchMessagesFilterPhoto = A.withObject "SearchMessagesFilterPhoto" $ \o -> do
    return $ SearchMessagesFilterPhoto {  }

   parseSearchMessagesFilterVideo :: A.Value -> T.Parser SearchMessagesFilter
   parseSearchMessagesFilterVideo = A.withObject "SearchMessagesFilterVideo" $ \o -> do
    return $ SearchMessagesFilterVideo {  }

   parseSearchMessagesFilterVoiceNote :: A.Value -> T.Parser SearchMessagesFilter
   parseSearchMessagesFilterVoiceNote = A.withObject "SearchMessagesFilterVoiceNote" $ \o -> do
    return $ SearchMessagesFilterVoiceNote {  }

   parseSearchMessagesFilterPhotoAndVideo :: A.Value -> T.Parser SearchMessagesFilter
   parseSearchMessagesFilterPhotoAndVideo = A.withObject "SearchMessagesFilterPhotoAndVideo" $ \o -> do
    return $ SearchMessagesFilterPhotoAndVideo {  }

   parseSearchMessagesFilterUrl :: A.Value -> T.Parser SearchMessagesFilter
   parseSearchMessagesFilterUrl = A.withObject "SearchMessagesFilterUrl" $ \o -> do
    return $ SearchMessagesFilterUrl {  }

   parseSearchMessagesFilterChatPhoto :: A.Value -> T.Parser SearchMessagesFilter
   parseSearchMessagesFilterChatPhoto = A.withObject "SearchMessagesFilterChatPhoto" $ \o -> do
    return $ SearchMessagesFilterChatPhoto {  }

   parseSearchMessagesFilterVideoNote :: A.Value -> T.Parser SearchMessagesFilter
   parseSearchMessagesFilterVideoNote = A.withObject "SearchMessagesFilterVideoNote" $ \o -> do
    return $ SearchMessagesFilterVideoNote {  }

   parseSearchMessagesFilterVoiceAndVideoNote :: A.Value -> T.Parser SearchMessagesFilter
   parseSearchMessagesFilterVoiceAndVideoNote = A.withObject "SearchMessagesFilterVoiceAndVideoNote" $ \o -> do
    return $ SearchMessagesFilterVoiceAndVideoNote {  }

   parseSearchMessagesFilterMention :: A.Value -> T.Parser SearchMessagesFilter
   parseSearchMessagesFilterMention = A.withObject "SearchMessagesFilterMention" $ \o -> do
    return $ SearchMessagesFilterMention {  }

   parseSearchMessagesFilterUnreadMention :: A.Value -> T.Parser SearchMessagesFilter
   parseSearchMessagesFilterUnreadMention = A.withObject "SearchMessagesFilterUnreadMention" $ \o -> do
    return $ SearchMessagesFilterUnreadMention {  }

   parseSearchMessagesFilterUnreadReaction :: A.Value -> T.Parser SearchMessagesFilter
   parseSearchMessagesFilterUnreadReaction = A.withObject "SearchMessagesFilterUnreadReaction" $ \o -> do
    return $ SearchMessagesFilterUnreadReaction {  }

   parseSearchMessagesFilterFailedToSend :: A.Value -> T.Parser SearchMessagesFilter
   parseSearchMessagesFilterFailedToSend = A.withObject "SearchMessagesFilterFailedToSend" $ \o -> do
    return $ SearchMessagesFilterFailedToSend {  }

   parseSearchMessagesFilterPinned :: A.Value -> T.Parser SearchMessagesFilter
   parseSearchMessagesFilterPinned = A.withObject "SearchMessagesFilterPinned" $ \o -> do
    return $ SearchMessagesFilterPinned {  }
 parseJSON _ = mempty
