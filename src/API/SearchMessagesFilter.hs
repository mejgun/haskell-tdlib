-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.SearchMessagesFilter where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data SearchMessagesFilter = 
 SearchMessagesFilterEmpty 
 | SearchMessagesFilterAnimation 
 | SearchMessagesFilterAudio 
 | SearchMessagesFilterDocument 
 | SearchMessagesFilterPhoto 
 | SearchMessagesFilterVideo 
 | SearchMessagesFilterVoiceNote 
 | SearchMessagesFilterPhotoAndVideo 
 | SearchMessagesFilterUrl 
 | SearchMessagesFilterChatPhoto 
 | SearchMessagesFilterCall 
 | SearchMessagesFilterMissedCall 
 | SearchMessagesFilterVideoNote 
 | SearchMessagesFilterVoiceAndVideoNote 
 | SearchMessagesFilterMention 
 | SearchMessagesFilterUnreadMention deriving (Show, Eq)

instance T.ToJSON SearchMessagesFilter where
 toJSON (SearchMessagesFilterEmpty {  }) =
  A.object [ "@type" A..= T.String "searchMessagesFilterEmpty" ]

 toJSON (SearchMessagesFilterAnimation {  }) =
  A.object [ "@type" A..= T.String "searchMessagesFilterAnimation" ]

 toJSON (SearchMessagesFilterAudio {  }) =
  A.object [ "@type" A..= T.String "searchMessagesFilterAudio" ]

 toJSON (SearchMessagesFilterDocument {  }) =
  A.object [ "@type" A..= T.String "searchMessagesFilterDocument" ]

 toJSON (SearchMessagesFilterPhoto {  }) =
  A.object [ "@type" A..= T.String "searchMessagesFilterPhoto" ]

 toJSON (SearchMessagesFilterVideo {  }) =
  A.object [ "@type" A..= T.String "searchMessagesFilterVideo" ]

 toJSON (SearchMessagesFilterVoiceNote {  }) =
  A.object [ "@type" A..= T.String "searchMessagesFilterVoiceNote" ]

 toJSON (SearchMessagesFilterPhotoAndVideo {  }) =
  A.object [ "@type" A..= T.String "searchMessagesFilterPhotoAndVideo" ]

 toJSON (SearchMessagesFilterUrl {  }) =
  A.object [ "@type" A..= T.String "searchMessagesFilterUrl" ]

 toJSON (SearchMessagesFilterChatPhoto {  }) =
  A.object [ "@type" A..= T.String "searchMessagesFilterChatPhoto" ]

 toJSON (SearchMessagesFilterCall {  }) =
  A.object [ "@type" A..= T.String "searchMessagesFilterCall" ]

 toJSON (SearchMessagesFilterMissedCall {  }) =
  A.object [ "@type" A..= T.String "searchMessagesFilterMissedCall" ]

 toJSON (SearchMessagesFilterVideoNote {  }) =
  A.object [ "@type" A..= T.String "searchMessagesFilterVideoNote" ]

 toJSON (SearchMessagesFilterVoiceAndVideoNote {  }) =
  A.object [ "@type" A..= T.String "searchMessagesFilterVoiceAndVideoNote" ]

 toJSON (SearchMessagesFilterMention {  }) =
  A.object [ "@type" A..= T.String "searchMessagesFilterMention" ]

 toJSON (SearchMessagesFilterUnreadMention {  }) =
  A.object [ "@type" A..= T.String "searchMessagesFilterUnreadMention" ]

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
   "searchMessagesFilterCall" -> parseSearchMessagesFilterCall v
   "searchMessagesFilterMissedCall" -> parseSearchMessagesFilterMissedCall v
   "searchMessagesFilterVideoNote" -> parseSearchMessagesFilterVideoNote v
   "searchMessagesFilterVoiceAndVideoNote" -> parseSearchMessagesFilterVoiceAndVideoNote v
   "searchMessagesFilterMention" -> parseSearchMessagesFilterMention v
   "searchMessagesFilterUnreadMention" -> parseSearchMessagesFilterUnreadMention v
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

   parseSearchMessagesFilterCall :: A.Value -> T.Parser SearchMessagesFilter
   parseSearchMessagesFilterCall = A.withObject "SearchMessagesFilterCall" $ \o -> do
    return $ SearchMessagesFilterCall {  }

   parseSearchMessagesFilterMissedCall :: A.Value -> T.Parser SearchMessagesFilter
   parseSearchMessagesFilterMissedCall = A.withObject "SearchMessagesFilterMissedCall" $ \o -> do
    return $ SearchMessagesFilterMissedCall {  }

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