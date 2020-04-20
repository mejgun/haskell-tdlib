-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.TextEntityType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data TextEntityType = 
 TextEntityTypeMention 
 | TextEntityTypeHashtag 
 | TextEntityTypeCashtag 
 | TextEntityTypeBotCommand 
 | TextEntityTypeUrl 
 | TextEntityTypeEmailAddress 
 | TextEntityTypePhoneNumber 
 | TextEntityTypeBankCardNumber 
 | TextEntityTypeBold 
 | TextEntityTypeItalic 
 | TextEntityTypeUnderline 
 | TextEntityTypeStrikethrough 
 | TextEntityTypeCode 
 | TextEntityTypePre 
 | TextEntityTypePreCode { language :: String }  
 | TextEntityTypeTextUrl { url :: String }  
 | TextEntityTypeMentionName { user_id :: Int }  -- deriving (Show)

instance T.ToJSON TextEntityType where
 toJSON (TextEntityTypeMention {  }) =
  A.object [ "@type" A..= T.String "textEntityTypeMention" ]

 toJSON (TextEntityTypeHashtag {  }) =
  A.object [ "@type" A..= T.String "textEntityTypeHashtag" ]

 toJSON (TextEntityTypeCashtag {  }) =
  A.object [ "@type" A..= T.String "textEntityTypeCashtag" ]

 toJSON (TextEntityTypeBotCommand {  }) =
  A.object [ "@type" A..= T.String "textEntityTypeBotCommand" ]

 toJSON (TextEntityTypeUrl {  }) =
  A.object [ "@type" A..= T.String "textEntityTypeUrl" ]

 toJSON (TextEntityTypeEmailAddress {  }) =
  A.object [ "@type" A..= T.String "textEntityTypeEmailAddress" ]

 toJSON (TextEntityTypePhoneNumber {  }) =
  A.object [ "@type" A..= T.String "textEntityTypePhoneNumber" ]

 toJSON (TextEntityTypeBankCardNumber {  }) =
  A.object [ "@type" A..= T.String "textEntityTypeBankCardNumber" ]

 toJSON (TextEntityTypeBold {  }) =
  A.object [ "@type" A..= T.String "textEntityTypeBold" ]

 toJSON (TextEntityTypeItalic {  }) =
  A.object [ "@type" A..= T.String "textEntityTypeItalic" ]

 toJSON (TextEntityTypeUnderline {  }) =
  A.object [ "@type" A..= T.String "textEntityTypeUnderline" ]

 toJSON (TextEntityTypeStrikethrough {  }) =
  A.object [ "@type" A..= T.String "textEntityTypeStrikethrough" ]

 toJSON (TextEntityTypeCode {  }) =
  A.object [ "@type" A..= T.String "textEntityTypeCode" ]

 toJSON (TextEntityTypePre {  }) =
  A.object [ "@type" A..= T.String "textEntityTypePre" ]

 toJSON (TextEntityTypePreCode { language = language }) =
  A.object [ "@type" A..= T.String "textEntityTypePreCode", "language" A..= language ]

 toJSON (TextEntityTypeTextUrl { url = url }) =
  A.object [ "@type" A..= T.String "textEntityTypeTextUrl", "url" A..= url ]

 toJSON (TextEntityTypeMentionName { user_id = user_id }) =
  A.object [ "@type" A..= T.String "textEntityTypeMentionName", "user_id" A..= user_id ]
-- textEntityTypeMention TextEntityType 

-- textEntityTypeHashtag TextEntityType 

-- textEntityTypeCashtag TextEntityType 

-- textEntityTypeBotCommand TextEntityType 

-- textEntityTypeUrl TextEntityType 

-- textEntityTypeEmailAddress TextEntityType 

-- textEntityTypePhoneNumber TextEntityType 

-- textEntityTypeBankCardNumber TextEntityType 

-- textEntityTypeBold TextEntityType 

-- textEntityTypeItalic TextEntityType 

-- textEntityTypeUnderline TextEntityType 

-- textEntityTypeStrikethrough TextEntityType 

-- textEntityTypeCode TextEntityType 

-- textEntityTypePre TextEntityType 

-- textEntityTypePreCode TextEntityType  { language :: String } 

-- textEntityTypeTextUrl TextEntityType  { url :: String } 

-- textEntityTypeMentionName TextEntityType  { user_id :: Int } 

