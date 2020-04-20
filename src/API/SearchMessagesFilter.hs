-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.SearchMessagesFilter where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

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
 | SearchMessagesFilterUnreadMention -- deriving (Show)

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
-- searchMessagesFilterEmpty SearchMessagesFilter 

-- searchMessagesFilterAnimation SearchMessagesFilter 

-- searchMessagesFilterAudio SearchMessagesFilter 

-- searchMessagesFilterDocument SearchMessagesFilter 

-- searchMessagesFilterPhoto SearchMessagesFilter 

-- searchMessagesFilterVideo SearchMessagesFilter 

-- searchMessagesFilterVoiceNote SearchMessagesFilter 

-- searchMessagesFilterPhotoAndVideo SearchMessagesFilter 

-- searchMessagesFilterUrl SearchMessagesFilter 

-- searchMessagesFilterChatPhoto SearchMessagesFilter 

-- searchMessagesFilterCall SearchMessagesFilter 

-- searchMessagesFilterMissedCall SearchMessagesFilter 

-- searchMessagesFilterVideoNote SearchMessagesFilter 

-- searchMessagesFilterVoiceAndVideoNote SearchMessagesFilter 

-- searchMessagesFilterMention SearchMessagesFilter 

-- searchMessagesFilterUnreadMention SearchMessagesFilter 

